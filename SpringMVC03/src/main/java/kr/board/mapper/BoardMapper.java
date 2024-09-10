package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

@Mapper // MyBatis API
public interface BoardMapper {
	public List<Board> getLists(); // 전체리스트

	public Board boardDetail(int idx); // 게시글상세보기

	public void boardInsert(Board vo); // 게시글작성

	public void boardDelete(int idx); // 게시글삭제
	
	public void boardUpdate(Board vo); // 게시글수정
	
	@Update("update myboard set count = count+1 where idx = #{idx}")
	public void boardCount(int idx); // 조회수
}
