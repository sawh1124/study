package egovframework.board.service;


import java.util.List;

import egovframework.board.bean.BoardBean;
import egovframework.pagination.bean.Search;

public interface BoardService {

	int insertboard(BoardBean bean);

	List<BoardBean> selectBoardList(Search search);

	int getBoardListcnt(Search search);

	BoardBean selectBoardOne(int no);

	void BoardUpdate(BoardBean boardBean);

	void BoardDelete(BoardBean boardBean);



		

}
