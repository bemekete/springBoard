package kr.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BoardController {
	
	private final BoardMapper mapper;
	
	// 메인
	@RequestMapping("/")
	public String main() {
		return "main";
	}

	// 게시글목록
	@RequestMapping("/boardList.do")
	public @ResponseBody List<Board> boardList(){
		List<Board> list = mapper.getLists();
		return list;
	}
	
	// 게시글등록
	@RequestMapping("/boardInsert.do")
	public @ResponseBody void boardInsert(Board vo) {
		mapper.boardInsert(vo);
	}
	
	// 게시글삭제
	@RequestMapping("/boardDelete.do")
	public @ResponseBody void boardDelete(@RequestParam("idx") int idx) {
		System.out.println(idx);
		mapper.boardDelete(idx);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
