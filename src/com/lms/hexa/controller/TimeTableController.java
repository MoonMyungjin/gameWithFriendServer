package com.lms.hexa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lms.hexa.dto.TimeTableSettingVO;
import com.lms.hexa.dto.TimeTableVO;
import com.lms.hexa.service.TimeTableService;

@Controller
@RequestMapping("/manager/timetable")
public class TimeTableController {
	
	@Autowired
	private TimeTableService timeTableService;
	
	@RequestMapping("/list")
	public ModelAndView ShowNowSetting(ModelAndView mnv) throws Exception {
		String url = "/manager/timetable/list";
		
		TimeTableSettingVO weekDayInfo = timeTableService.getWeekDaySettingvalue();
		mnv.addObject("weekDayInfo", weekDayInfo);
		
		TimeTableSettingVO weekEndInfo = timeTableService.getWeekEndSettingvalue();
		mnv.addObject("weekEndInfo", weekEndInfo);
		
		Map<String, List<TimeTableVO>> ttMap = timeTableService.getTimeTablevalue();
		mnv.addObject("ttMap", ttMap);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json")
	public String UpdateTime(@RequestBody HashMap<String, Object> params,RedirectAttributes rttr) throws Exception {
		String url = "redirect:/manager/timetable/list.do";
		
		int result = timeTableService.modifyTimeTableValues(params);
		
		if(result>0) {
			rttr.addFlashAttribute("msg", "ok");
		}
		rttr.addFlashAttribute("msg", "ng");
		
		return url;
	}
	
	
}
