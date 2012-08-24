package www.wwt.cn;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("/image")
@Controller
public class ImageController {

	@RequestMapping(value = "uploadPage", method = RequestMethod.GET)
	public String showProducts(HttpServletRequest request,Model model) {
		return "multiUpload";
	}
}
