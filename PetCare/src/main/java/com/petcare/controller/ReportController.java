package com.petcare.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.petcare.domain.Report;
import com.petcare.domain.ReportVo;
import com.petcare.service.ReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Controller
public class ReportController {
	private ReportService reportservice;
	@RequestMapping("/report/list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session, String reportcatgo, String reportkeyword, String reportsearchModeStr, String rep_state) {
		String cpStr = request.getParameter("reportcp");
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("reportcp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("reportcp", cp);
		
		int ps = 10;
		session.setAttribute("ps", ps);
		log.info("페이지로그"+cp+ps);
		
		if(reportcatgo ==null) {
			Object catgoObj = session.getAttribute("reportcatgo");
			if(catgoObj != null) {
				reportcatgo = (String) catgoObj;
			}
		}else {
			reportcatgo = reportcatgo.trim();
		}
		session.setAttribute("reportcatgo", reportcatgo);
		
		if(reportkeyword == null) {
			Object reportkeywordObj = session.getAttribute("reportkeyword");
			if(reportkeywordObj != null) {
				reportkeyword = (String) reportkeywordObj;
			}
		}else {
			reportkeyword = reportkeyword.trim();
		}
		session.setAttribute("reportkeyword", reportkeyword);
		
		log.info("검색결과: " + reportcatgo + reportkeyword);
		
		if(reportsearchModeStr == null) {
			Object reportsearchModeStrObj = session.getAttribute("reportsearchModeStr");
			if(reportsearchModeStrObj != null) {
				reportsearchModeStr = (String) reportsearchModeStrObj;
			}else {
				reportsearchModeStr = "F";
			}
		}else {
			reportsearchModeStr = reportsearchModeStr.trim();
		}
		session.setAttribute("reportsearchModeStr", reportsearchModeStr);
		log.info("searchmode: " + reportsearchModeStr);
		
		boolean searchMode = false;
		if(reportsearchModeStr.equalsIgnoreCase("T")) {
			searchMode = true;
		}
		log.info("널 판별"+rep_state);
		if(rep_state == null | rep_state == "") {
			rep_state = (String) session.getAttribute("rep_state");
			log.info("rep가 null"+rep_state);
		}else if((String) session.getAttribute("rep_state") == null) {
			rep_state = "처리";
		}
		session.setAttribute("rep_state", rep_state);
		log.info("처리상태: "+rep_state);
		log.info((String) session.getAttribute("rep_state"));
		ReportVo reportVo = null;
		if(!searchMode) {
			reportVo = reportservice.getReportVo(cp, ps);
			log.info("서치모드:"+searchMode);
		}else {
			reportVo = reportservice.getReportVo(cp, ps, reportcatgo, reportkeyword, rep_state);
		}
		reportVo.setRange(cp);
		log.info("리포트Vo:"+reportVo);
		ModelAndView mv = new ModelAndView("report/list","reportVo",reportVo);
		if(reportVo.getList().size() == 0) {
			log.info("사이즈가 0");
			if(cp>1) {
				return new ModelAndView("redirect:list.do?usercp="+(cp-1));
			}else {
				return new ModelAndView("report/list", "reportVo", null);
			}
		}else {
			log.info("#mv: "+mv);
			return mv;
		}
		
	}
	@GetMapping("/report.do")
	public ModelAndView report(String rep_wemail, String rep_remail, String rep_wseq) {
		log.info("작성자 이메일: " + rep_wemail+ "신고자 이메일: " + rep_remail + "신고글 시퀀스"+rep_wseq);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("rep_wemail",rep_wemail);
		map.put("rep_remail",rep_remail);
		map.put("rep_wseq",rep_wseq);
		ModelAndView mv = new ModelAndView("report/report", "report", map);
		return mv;
	}
	@PostMapping("/report.do")
	public String insertreport(Report report) {
		log.info("리포트"+report);
		reportservice.insertS(report);
		return "redirect:report/list.do";
	}
	@GetMapping("/report/content.do")
	public ModelAndView content(long rep_seq) {
		Report report = reportservice.contentS(rep_seq);
		ModelAndView mv = new ModelAndView("report/content","report", report);
		return mv;
	}
	@PostMapping("/report/content.do")
	public String insertcontent(String rep_state, int rep_seq) {
		log.info("업데이트"+rep_state+rep_seq);
		Report report = reportservice.contentS(rep_seq);
		String rep_wemail = report.getRep_wemail();
		String rep_remail = report.getRep_remail();
		if(rep_remail==rep_wemail) {
			
		}else {
			reportservice.updateS(rep_state, rep_seq);
		}
		return "redirect:list.do";
	}
	@GetMapping("/report/delete.do")
	public String deletecontent(int rep_seq) {
		reportservice.deleteS(rep_seq);
		return "redirect:list.do";
	}
	@GetMapping("/report/checkdelete")
	public @ResponseBody boolean checkdelete(@RequestParam(value="del_list[]") List<String> del_list) {
		log.info(del_list);
		for(int i=0;i<del_list.size();i++) {
			long rep_seq = Long.parseLong(del_list.get(i));
			reportservice.deleteS(rep_seq);
		}
		return true;
	}
}