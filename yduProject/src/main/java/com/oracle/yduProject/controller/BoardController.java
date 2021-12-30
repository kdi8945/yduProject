package com.oracle.yduProject.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.yduProject.model.B_Comment;
import com.oracle.yduProject.model.Board;
import com.oracle.yduProject.service.BoardService;
import com.oracle.yduProject.service.CommentService;
import com.oracle.yduProject.service.Paging;
@Controller
public class BoardController {

   @Autowired
   private BoardService bs;
   @Autowired
   private CommentService comm;

   //*** 전체 공지사항 게시판 시작 ***
    @RequestMapping("notiList")
   public String notiList(HttpServletRequest request, Board board, String currentPage, Model model) {
       HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         if(board.getB_type()==0) {
            board.setB_type(1);
         }
         System.out.println("***BoardController notiList Start***");
         System.out.println("board b_type :::: "+board.getB_type());
         System.out.println("board :::: " + board.toString());
         //Paging
         int total = bs.total(board.getB_type());
         Paging page = new  Paging(total, currentPage);
         System.out.println("paging toString:::::" + page.toString());
         board.setStart(page.getStart());
         board.setEnd(page.getEnd());
         //noti List
         List<Board> boardList = bs.boardList(board);
         System.out.println("BoardController notiList boardList" + boardList);
         //noti List 데이터 없음 처리
         if(boardList == null) {
            model.addAttribute("boardListSize", 0);
         } else {
            //new icon 오늘 날짜 구하기
            LocalDate now = LocalDate.now();
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String strNow = now.format(fmt);
            model.addAttribute("today", strNow);
            
            System.out.println("boardListSize" + boardList.size());
            model.addAttribute("total", total); //page total
            model.addAttribute("boardList", boardList);
            model.addAttribute("page", page);
            model.addAttribute("boardListSize", boardList.size());
            System.out.println(boardList.toString());
         }
         return "notiList";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   
   //공지사항 작성 폼
   @RequestMapping("notiWriteForm")
   public String notiWriteForm(HttpServletRequest request, Board board, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         model.addAttribute("board", board);
         
         return "notiWriteForm";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   
   //공지사항 작성
   @RequestMapping("notiWrite")
   @ResponseBody
   public String notiWrite(Board board, Model model) {
      System.out.println("***BoardController notiWrite Start***");
      String str = bs.notiWrite(board);
      
         return str;
      }
   
   //공지사항 수정 폼
   @RequestMapping("notiUpdateForm")
   public String notiUpdateForm(HttpServletRequest request, Board board, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         Board notiBoardInfo = bs.notiBoardInfo(board);
         model.addAttribute("notiBoardInfo", notiBoardInfo);
         return "notiUpdateForm"; //view resolver를 통해서 이동
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   
   //공지사항 수정
   @RequestMapping("notiUpdate")
   @ResponseBody   //Ajax 를 쓰기위해 ResponseBody 어노테이션 사용
   public int notiUpdate(Board board) { //나중에 String 으로 바꿔주기. Ajax 때문에 int로 선언.
      int result = bs.notiUpdate(board);
      
      return result;
   }
   //공지사항 컨텐츠
   @RequestMapping("notiContent")
   public String notiContent(HttpServletRequest request, Board board,B_Comment comment,Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         System.out.println("***BoardController notiContent Start***");
   
         System.out.println("notiContent b_num::::"+board.getB_num());
         System.out.println("notiContent b_type::::"+board.getB_type());      
         //Content
         Board boardList = bs.boardContent(board);
         //Comment List
         List<B_Comment> commentList = comm.commList(comment);
         int clSize = commentList.size();
         System.out.println("BoardController noticontent [댓글 리스트 실행]:::::: " + commentList);
         System.out.println("commentList toString()" + commentList.toString());
   
         model.addAttribute("boardContent", boardList);
         model.addAttribute("commentList", commentList);
         model.addAttribute("clSize",clSize);
         
         System.out.println("notiContent boardList " + boardList.toString());
   
         return "notiContent";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }   
   
   @RequestMapping("notiDelete")
   @ResponseBody
   public String notiDelete(Board board) {
      System.out.println("***BoardController notiDelete Start***");
      System.out.println("board :::: "+board);
      String result = bs.notiDelete(board); 
      
      return result;
   }
   
   // -----------------수업 공지사항 게시판 시작 -----------------
   
   //수업 공지사항 리스트
   @RequestMapping("classNotiList")
   public String classNotiList(HttpServletRequest request, Board board, String currentPage, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         System.out.println("***BoardController classNotiList Start***");
         System.out.println("classNotiList board b_type :::: "+board.getB_type());
         //Paging
         int total = bs.total(board.getB_type());
         Paging page = new  Paging(total, currentPage);
         System.out.println("paging toString:::::" + page.toString());
         board.setStart(page.getStart());
         board.setEnd(page.getEnd());
         //noti List
         List<Board> classBoardList = bs.classBoardList(board);
         System.out.println("BoardController classNotiList classBoardList" + classBoardList);
         if(classBoardList == null) {
            model.addAttribute("classBoardListSize", 0);
         } else {
            
            //new icon 오늘 날짜 구하기
            LocalDate now = LocalDate.now();
            DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String strNow = now.format(fmt);
            model.addAttribute("today", strNow);
            
            model.addAttribute("total", total);
            model.addAttribute("classBoardList", classBoardList);
            model.addAttribute("page", page);
            model.addAttribute("classBoardListSize", classBoardList.size());
            System.out.println(classBoardList.toString());
         }
         return "classNotiList";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   
   //수업 공지사항 작성 폼
   @RequestMapping("classNotiWriteForm")
   public String classNotiWriteForm(HttpServletRequest request, Board board, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         model.addAttribute("board",board);
         
         return "classNotiWriteForm";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }

   //수업 공지사항 작성
   @RequestMapping("classNotiWrite")
   @ResponseBody
   public String classNotiWrite(Board board, Model model) {
      System.out.println("***BoardController classNotiWrite Start***");
      System.out.println("board :::: "+board);
      String str = bs.classNotiWrite(board);
      return str;
   }

   //수업 공지사항 컨텐츠
   @RequestMapping("classNotiContent")
   public String classNotiContent(HttpServletRequest request, Board board, B_Comment comment, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         System.out.println("***BoardController classNotiContent Start***");
         System.out.println("classNotiContent b_num::::"+board.getB_num());
         System.out.println("classNotiContent b_type::::"+board.getB_type());   
         //Board noti Content
         Board boardList = bs.classNotiContent(board);
         //Class noti Comment
         List<B_Comment> classCommentList = comm.classCommentList(comment);
         int clSize = classCommentList.size();
         System.out.println("BoardController classNotiContent [수업 공지 게시판 댓글 리스트 실행]:::::: " + classCommentList);
         System.out.println("classNotiContent toString()" + classCommentList.toString());
         model.addAttribute("classCommentList", classCommentList);
         model.addAttribute("clSize",clSize);
         model.addAttribute("boardContent", boardList);
   
         System.out.println("classNotiContent boardList " + boardList.toString());
   
         return "classNotiContent";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }   
   //수업 공지사항 삭제
   @RequestMapping("classNotiDelete")
   @ResponseBody
   public String classNotiDelete(Board board, Model model) {
      System.out.println("***BoardController classNotiDelete Start***");
      
      String result = bs.classNotiDelete(board); 
      model.addAttribute("board",board);
      
      return result;
   }
      //수업 공지사항 수정 폼
   @RequestMapping("classNotiUpdateForm")
   public String classNotiUpdateForm(HttpServletRequest request, Board board, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         Board notiBoardInfo = bs.notiBoardInfo(board);
         model.addAttribute("notiBoardInfo", notiBoardInfo);
         return "classNotiUpdateForm";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   @RequestMapping("classNotiUpdate")
   @ResponseBody
   public int classNotiUpdate(Board board) {
      int result = bs.classNotiUpdate(board);
      
      return result;
   }

   //대나무숲 리스트 전체 불러오기
   @RequestMapping("bambooList")
   public String bambooList(HttpServletRequest request, Board board, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
         System.out.println("BoardController bambooListAll start");
         List<Board> bambooList = bs.bambooList(board);
         //board.setStart(board.getBambooStart());
         //board.setEnd(board.getBambooEnd());
         System.out.println("bamboo board toString():::" + board.toString());
         System.out.println("bambooList List:::::::" + bambooList);
         System.out.println("bambooList list size" + bambooList.size());
         model.addAttribute("bambooList", bambooList);
         return "bambooList";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   @RequestMapping("bambooWrite")
   @ResponseBody
   public Board bambooWrite(Board board, Model model) {
      System.out.println("BoardController bambooWrite start");
      // 메세지를 String 형태가 아닌 json 형태로 전송하는 방법
      Board returnDto = bs.bambooWrite(board); //오브젝트 형태로 새로 선언해서 넣어준다.
      System.out.println("returnDto ::: " + returnDto);
      return returnDto;
   }
   @RequestMapping("bambooDelete")
   @ResponseBody
   public Board bambooDelete(Board board) {
      System.out.println("BoardController bambooDelete start");
      
      Board bambooDelete = bs.bambooDelete(board);
      System.out.println("Controller bambooDelete returnDTO::::" + bambooDelete);
      
      return bambooDelete;
   }
   @RequestMapping("bambooUpdate")
   @ResponseBody
   public Board bambooUpdate(Board board) {
      System.out.println("BoardController bambooUpdate Start");
      Board bambooUpdate = bs.bambooUpdate(board);
      System.out.println("bambooUpdate returnDto:::" + bambooUpdate);
      
      return bambooUpdate;
   }
   @RequestMapping("bambooUpdateCancel")
   @ResponseBody
   public Board bambooUpdateCancel(Board board) {
      System.out.println("bambooUpdateCancel start");
      Board bambooUpdateCancel = bs.bambooUpdateCancel(board);
      
      return bambooUpdateCancel;
   }
   
   @RequestMapping("viewMyBamboo")
   public String viewMyBamboo(HttpServletRequest request,Board board, Model model) {
      HttpSession session = request.getSession();
      try {
         int mem_status = (int) session.getAttribute("sessionMem_status");
         int autority = (int) session.getAttribute("sessionAutority");
         String id = (String) session.getAttribute("sessionId");
          if(board.getB_type() == 0) {
             board.setB_type(1);
          }
      System.out.println("BoardController viewMyBamboo board ::: "+board);
      List<Board> viewMyBamboo = bs.viewMyBamboo(board);
      System.out.println("viewMyBamboo::::" + viewMyBamboo); 
      System.out.println("viewMyBambooList toString():::::" + viewMyBamboo.toString());
      if(viewMyBamboo == null || viewMyBamboo.size() == 0){
         model.addAttribute("viewMyBambooSize", 0);
      }else {
         model.addAttribute("viewMyBambooSize", viewMyBamboo.size());
         model.addAttribute("viewMyBamboo", viewMyBamboo);
      }
         return "viewMyBamboo";
      } catch (Exception e) {
         return "sessionIsNull";
      }
   }
   
   @RequestMapping("viewMyBambooDelete")
   @ResponseBody
   public Board viewMyBambooDelete(Board board) {
      System.out.println("BoardController viewMyBambooDelete start");
      Board viewMyBambooDelete = bs.viewMyBambooDelete(board);
      
      return viewMyBambooDelete;
   }
   
}