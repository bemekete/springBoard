package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper; 
	
	// 게시글목록
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		List<Board> list  = mapper.getLists();
		model.addAttribute("list", list);
		return "boardList";
	}
	
	// 게시글입력 폼으로
	@GetMapping("/boardForm.do")
	public String boardForm() {
		return "boardForm";
	}
	
	// 게시글입력
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		mapper.boardInsert(vo); // 게시글등록
		return "redirect:/boardList.do"; 
	}
	
	// 게시글상세보기
	@GetMapping("/boardDetail.do")
	public String boardDetail(Model model ,@RequestParam("idx") int idx) {
		mapper.boardCount(idx); // 조회수증가
		Board vo = mapper.boardDetail(idx);
		model.addAttribute("vo", vo);
		return "boardDetail";
	}
	
	// 게시글삭제
	@GetMapping("/boardDelete.do")
	public String boardDelete(@RequestParam("idx") int idx) {
		mapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}
	
	// 게시글수정화면
	@GetMapping("/boardUpdateForm.do")
	public String boardUpdateForm(Model model, @RequestParam("idx") int idx) {
		Board vo = mapper.boardDetail(idx);
		model.addAttribute("vo", vo);
		return "boardUpdate";
	}
	
	// 게시글수정
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo, Model model) {
		mapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
