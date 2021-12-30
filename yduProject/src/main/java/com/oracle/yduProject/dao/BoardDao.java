package com.oracle.yduProject.dao;

import java.util.List;

import com.oracle.yduProject.model.Board;

public interface BoardDao {

   List<Board> boardList(Board board);

   int notiWrite(Board board);

   int notiUpdate(Board board);

   Board notiBoardInfo(Board board);

   Board notiContent(Board board);

   int notiDelete(Board board);

   List<Board> classBoardList(Board board);

   int total(int b_type);

   int classNotiWrite(Board board);

   Board classNotiContent(Board board);

   int classNotiDelete(Board board);

   int classNotiUpdate(Board board);

   List<Board> bambooList(Board board);

   Board bambooWrite(Board board);

   Board bambooDelete(Board board);

   Board bambooUpdate(Board board);

   Board bambooUpdateCancel(Board board);

   List<Board> viewMyBamboo(Board board);

   Board viewMyBambooDelete(Board board);


}