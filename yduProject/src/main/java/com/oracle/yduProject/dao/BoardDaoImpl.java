package com.oracle.yduProject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.yduProject.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
   @Autowired
   private SqlSession session;

   @Override
   public List<Board> boardList(Board board) {
      List<Board> boardList = null;
      System.out.println("BoardDaoImpl boardList start");
      try {
         boardList = session.selectList("notiBoardList", board);
      } catch (Exception e) {
         // TODO: handle exception
      }
      return boardList;
   }

   @Override
   public int notiWrite(Board board) {
      int notiWriteResult = 0;
      try {
         notiWriteResult = session.insert("notiWrite", board);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return notiWriteResult;
   }

   @Override
   public int notiUpdate(Board board) {
      int notiUpdateResult = 0;

      try {
         notiUpdateResult = session.update("notiUpdate", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return notiUpdateResult;
   }

   @Override
   public Board notiBoardInfo(Board board) {
      Board notiBoardInfo = null;
      try {
         notiBoardInfo = session.selectOne("notiBoardInfo", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return notiBoardInfo;
   }

   @Override
   public Board notiContent(Board board) {
      Board notiBoardContent = null;
      try {
         session.update("notiViewCnt",board); //조회수 
         notiBoardContent = session.selectOne("notiContent", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return notiBoardContent;
   }

   @Override
   public int notiDelete(Board board) {
      int notiDeleteResult = 0;
      try {
         List<Integer> notiCommChk = session.selectList("notiCommListChk", board);
         if(notiCommChk.size() > 0) {
            for(int c_num : notiCommChk) {
               session.delete("commDelete", c_num);
            }
         }
         notiDeleteResult = session.delete("notiDelete", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return notiDeleteResult;
   }


   @Override
   public List<Board> classBoardList(Board board) {
      List<Board> classBoardList = null;
      System.out.println("BoardDaoImpl classBoardList start");
      try {
         classBoardList = session.selectList("classNotiBoardList", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return classBoardList;
   }

   @Override
   public int total(int b_type) {
      int total = 0;
      try {
         total = session.selectOne("total", b_type);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return total;
   }

   @Override
   public int classNotiWrite(Board board) {
      int classNotiWriteResult = 0;
      try {
         classNotiWriteResult = session.insert("classNotiWrite", board);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return classNotiWriteResult;
   }

   @Override
   public Board classNotiContent(Board board) {
      Board classNotiContentResult = null;
      try {
         session.update("notiViewCnt",board); //조회수 
         classNotiContentResult = session.selectOne("classNotiContent", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return classNotiContentResult;
   }
   
   @Override
   public int classNotiDelete(Board board) {
      int classNotiDeleteResult = 0;
      
      try {
         List<Integer> classNotiCommChk = session.selectList("notiCommListChk", board);
         if(classNotiCommChk.size() > 0) {
            for(int c_num : classNotiCommChk) {
               session.delete("classCommDelete", c_num);
            }
         }
         classNotiDeleteResult = session.delete("classNotiDelete", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return classNotiDeleteResult;
   }

   @Override
   public int classNotiUpdate(Board board) {
      int classNotiUpdResult = 0;

      try {
         classNotiUpdResult = session.update("classNotiUpdate", board);
      } catch (Exception e) {
         e.getStackTrace();
      }
      return classNotiUpdResult;
   }

   @Override
   public List<Board> bambooList(Board board) {
      System.out.println("BoardDaoImpl bambooList Start");
      List<Board> bambooList = null;
      
      try {
         bambooList = session.selectList("bambooListAll", board);
         System.out.println("BoardDao bambooList :::" + bambooList);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bambooList;
   }

   @Override
   public Board bambooWrite(Board board) {
      Board returnDto = new Board();
      try {
         int writeChk = session.insert("bambooWrite", board);
         if(writeChk > 0) {
            returnDto.setResultMsg("대나무숲 작성이 완료되었습니다!!");
         } else {
            returnDto.setResultMsg("대나무숲 작성 처리에 오류가 발생하였습니다.");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return returnDto;
   }

   @Override
   public Board bambooDelete(Board board) {
      System.out.println("BoardDaoImpl bambooDelete start");
      Board returnDto = new Board();
      try {
         int deleteChk = session.delete("bambooDelete", board);
         if(deleteChk > 0) {
            returnDto.setResultMsg("대나무숲 삭제가 완료되었습니다!");
         }else {
            returnDto.setResultMsg("대나무숲 삭제 처리에 오류가 발생하였습니다.");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return returnDto;
   }

   @Override
   public Board bambooUpdate(Board board) {
      System.out.println("BoardDaoImpl bambooUpdate Start");
      Board bambooUpdate = new Board();
      try {
         int updateChk = session.update("bambooUpdate", board);
         if(updateChk > 0) {
            bambooUpdate = session.selectOne("bambooUpdateAfter", board);
            bambooUpdate.setResultMsg("대나무숲 수정이 완료 되었습니다!");
            
         }else {
            bambooUpdate.setResultMsg("대나무숲 수정 처리에 오류가 발생하였습니다.");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bambooUpdate;
   }

   @Override
   public Board bambooUpdateCancel(Board board) {
      Board bambooUpdateCancel = new Board();
      try {
         bambooUpdateCancel = session.selectOne("bambooUpdateCancel", board);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bambooUpdateCancel;
   }

   @Override
   public List<Board> viewMyBamboo(Board board) {
      List<Board> viewMyBamboo = null;
      System.out.println("BoardDaoImpl viewMyBambo start");
      try {
         viewMyBamboo = session.selectList("viewMyBamboo",board);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return viewMyBamboo;
   }

   @Override
   public Board viewMyBambooDelete(Board board) {
      System.out.println("BoardDaoImpl viewMyBambooDelete start");
      Board returnDto = new Board();
      try {
         int deleteChk = session.delete("viewMyBambooDelete", board);
         if(deleteChk > 0) {
            returnDto.setResultMsg("내가 쓴 대나무숲 글 삭제가 완료되었습니다!");
         }else {
            returnDto.setResultMsg("삭제 처리에 오류가 발생하였습니다.");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return returnDto;
   }

}