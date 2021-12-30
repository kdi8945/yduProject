package com.oracle.yduProject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.yduProject.dao.BoardDao;
import com.oracle.yduProject.model.Board;

@Service
public class BoardServiceImpl implements BoardService {
   @Autowired
   private BoardDao bd;

   //Board List
   @Override
   public List<Board> boardList(Board board) {
      System.out.println("///BoardServiceImpl [boardList] start///");
      return bd.boardList(board);
   }

   //공지사항 작성하기 
   @Override
   public String notiWrite(Board board) {
      System.out.println("///BoardServiceImpl [notiWrite] start///");
      String str;
      int result = bd.notiWrite(board);
      
      if(result > 0) {
         str = "writeok";
      }else {
         str = "writeerror";
      }
      return str;   
   }
   
   @Override
   public Board notiBoardInfo(Board board) {
      
      return bd.notiBoardInfo(board);
   }

   @Override
   public int notiUpdate(Board board) {
      System.out.println("///BoardServiceImpl [notiUpdate] start///");

      
      int result = bd.notiUpdate(board);
      
      return result;
   }

   @Override
   public Board boardContent(Board board) {
      System.out.println("///BoardServiceImpl [boardContent] start///");
      
      return bd.notiContent(board);
   }

   @Override
   public String notiDelete(Board board) {
      String result=null;
      
      int notiDelete = bd.notiDelete(board);
      if(notiDelete >0) {
         result = "deleteok";
      } else {
         result = "deleteError";
      }
      return result;
   }


   @Override
   public List<Board> classBoardList(Board board) {
      System.out.println("///BoardServiceImpl [classBoardList] start///");
      return bd.classBoardList(board);
   }

   @Override
   public int total(int b_type) {
      
      return bd.total(b_type);
   }

   @Override
   public String classNotiWrite(Board board) {
      String str;
      int result = bd.classNotiWrite(board);
      if(result>0) {
         str = "writeok";
      } else {
         str = "writeerror";
      }
      return str;   
   }

   @Override
   public Board classNotiContent(Board board) {
      System.out.println("///BoardServiceImpl [classNotiContent] start///");

      
      return bd.classNotiContent(board);
   }

   @Override
   public String classNotiDelete(Board board) {
      String result=null;
      
      int classNotiDelete = bd.classNotiDelete(board);
      if(classNotiDelete >0) {
         result = "deleteok";
      } else {
         result = "deleteError";
      }
      return result;
   }

   @Override
   public int classNotiUpdate(Board board) {
      int result = bd.classNotiUpdate(board);
      
      return result;
   }

   @Override
   public List<Board> bambooList(Board board) {
      System.out.println("BoardServiceImpl [bambooList] start");
      
      return bd.bambooList(board);
   }

   @Override
   public Board bambooWrite(Board board) {// String 형태의 결과 메세지를 String이 아닌 객체에 담아서 전송(json 활용방법)
      // 리턴타입 dto와 파라미터 dto가 같은형태인데도 메서드내에서 새로 만드는 이유는
      // 프로그래밍 중 메서드 내 로직으로 인하여 파라미터 dto가 변동이 있거나
      // 리턴 후 controller에서 사용하려는 dto 내에 있어서는 안되는 데이터가
      // 파라미터 dto에 있을수도 있기 떄문에
      
      return bd.bambooWrite(board);
   }

   @Override
   public Board bambooDelete(Board board) {
      System.out.println("BoardService bambooDelete start");
      
      return bd.bambooDelete(board);
   }

   @Override
   public Board bambooUpdate(Board board) {
      System.out.println("BoardServiceImpl bambooUpdate start");

      return bd.bambooUpdate(board);
   }

   @Override
   public Board bambooUpdateCancel(Board board) {
      return bd.bambooUpdateCancel(board);
   }

   @Override
   public List<Board> viewMyBamboo(Board board) {
      System.out.println("BoardServiceImpl viewMyBamboo start");
      
      return bd.viewMyBamboo(board);
   }

   @Override
   public Board viewMyBambooDelete(Board board) {
      System.out.println("BoardServiceImpl viewMyBambooDelete start");
      
      return bd.viewMyBambooDelete(board);
   }

}