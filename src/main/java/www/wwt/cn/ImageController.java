package www.wwt.cn;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String showProducts(HttpServletRequest request,Model model) {
		return "imageUpload";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam("imgFile") MultipartFile imgFile,
			@RequestParam("userid") String userid ) throws Exception {
		URL url=imageService.uploadProductImage(imgFile, userid);
		ModelAndView modelAndView=new ModelAndView("uploadResult");
		System.out.println(url);
		modelAndView.addObject("url", url);
		
		Image image=new Image();
		image.setDate(new Date());
//		SimpleDateFormat dateFormat=new SimpleDateFormat("yyMMddHHmmss");
//		image.setName(dateFormat.format(new Date())+"_"+imgFile.getOriginalFilename());
		image.setName(imgFile.getOriginalFilename());
		image.setUrl(url.toString());
		image.setUserName(userid);
		imageRepository.save(image);
		
		return modelAndView;
	}
}
