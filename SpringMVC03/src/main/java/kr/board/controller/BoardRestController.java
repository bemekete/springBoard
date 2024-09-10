package kr.board.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;
import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/board")
@AllArgsConstructor
public class BoardRestController {

	private final BoardMapper mapper;

	// 게시글목록
	@GetMapping("/list")
	public List<Board> boardList() {
		List<Board> list = mapper.getLists();
		return list;
	}

	// 게시글등록
	@PostMapping("/insert")
	public void boardInsert(Board vo) {
		mapper.boardInsert(vo);
	}

	// 게시글삭제
	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") int idx) {
		mapper.boardDelete(idx);
	}

	// 게시글수정
	@PutMapping("/update")
	public void boardUpdate(@RequestBody Board vo) {
		mapper.boardUpdate(vo);
	}

	// 게시글상세보기
	@GetMapping("/{idx}")
	public Board boardDetail(@PathVariable("idx") int idx) {
		mapper.boardCount(idx); // 조회수증가
		Board vo = mapper.boardDetail(idx);
		return vo;
	}
}
