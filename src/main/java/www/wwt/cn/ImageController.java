package www.wwt.cn;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.wwt.cn.beauty.model.Image;
import com.wwt.cn.beauty.repository.ImageRepository;
import com.wwt.cn.beauty.service.ImageService;


@RequestMapping("/image")
@Controller
public class ImageController {
	
	@Autowired
	ImageService imageService;
	
	@Autowired
	ImageRepository imageRepository;

	@RequestMapping(value = "uploadPage", method = RequestMethod.GET)
	public String showUploadPage() {
		return "imageUpload";
	}
	
	@RequestMapping(value = "multiUpload", method = RequestMethod.GET)
	public String showMultiUploadPage() {
		return "multiUpload";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ResponseEntity<String> upload(@RequestParam("imgFile") MultipartFile imgFile,
			@RequestParam("userid") String userid ) {
		try {
			
		URL url=imageService.uploadProductImage(imgFile, userid);
		System.out.println(url);
		
		Image image=new Image();
		image.setDate(new Date());
//		SimpleDateFormat dateFormat=new SimpleDateFormat("yyMMddHHmmss");
//		image.setName(dateFormat.format(new Date())+"_"+imgFile.getOriginalFilename());
		image.setName(imgFile.getOriginalFilename());
		image.setUrl(url.toString());
		image.setUserName(userid);
		imageRepository.save(image);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<String>("upload failed",HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	

	@RequestMapping(value = "demo", method = RequestMethod.GET)
	public String showDemo(Model model) {
//		return "demo_Masonry";
		Page<Image> imagePage=imageRepository.findAll(new PageRequest(0, 10));
		model.addAttribute("images", imagePage.iterator());
		return "demo_masonry";
	}
	
	@RequestMapping(value = "loading/{no}", method = RequestMethod.GET)
	public String showDemoNo(@PathVariable int no,Model model) {
		System.out.println(no);
//		Iterable<Image> images= imageRepository.findAll();
//		model.addAttribute("images", images);
		Page<Image> imagePage=imageRepository.findAll(new PageRequest(no-1, 10));
		model.addAttribute("images", imagePage.iterator());
		return "demo_template";
	}
	
	

	@RequestMapping(value = "all", method = RequestMethod.GET)
	public String showAll(Model model) {
		Iterable<Image> iterable= imageRepository.findAll();
		model.addAttribute("images", iterable.iterator());
		return "all";
	}


	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(Model model,@PathVariable String id) {
		imageRepository.delete(new ObjectId(id));
		
		return "redirect:../all";
	}
}
