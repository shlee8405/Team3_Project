package com.team.controller.group;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("groupOnelist")
public class GroupButton {
	   private static final int MAX_BUTTON_CLICKS = 3;

	    @GetMapping("/buttonPage")
	    public ModelAndView showButtonPage(Model model) {
	        if (!model.containsAttribute("buttonCount")) {
	            model.addAttribute("buttonCount", 0);
	        }
	        return new ModelAndView("groupOnelist");
	    }

	    @PostMapping("/incrementButtonClick")
	    public ModelAndView incrementButtonClick(Model model) {
	        Integer buttonCount = (Integer) model.getAttribute("buttonCount");
	        if (buttonCount == null) {
	            buttonCount = 1;
	        } else {
	            buttonCount++;
	        }
	        model.addAttribute("buttonCount", buttonCount);
	        
	        if (buttonCount >= MAX_BUTTON_CLICKS) {
	            model.addAttribute("maxButtonClicksReached", true);
	        }

	        return new ModelAndView("groupOnelist");
	    }

	    @PostMapping("/cancelButtonClick")
	    public ModelAndView cancelButtonClick(Model model) {
	        model.addAttribute("buttonCount", 0);
	        model.addAttribute("maxButtonClicksReached", false);
	        return new ModelAndView("groupOnelist");
	    }
	

}
