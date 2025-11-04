/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.BookDAO;
import dao.BookVariantDAO;
import dao.RatingDAO;
import entity.Book;
import entity.BookVariants;
import entity.Rating;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BookService {
    private final BookDAO bookDAO;
    private final BookVariantDAO variantDAO;
    private final RatingDAO ratingDao;
    

    public BookService() {
        this.bookDAO= new BookDAO();
        this.variantDAO= new BookVariantDAO();
        this.ratingDao= new RatingDAO();
    }
    public List<Book> getNewestBook() throws Exception{
        return bookDAO.findNewestBooks(10);
    }
    public List<Book> getBestSellerBook() throws Exception{
        return bookDAO.bookBestSeller();
    }
    public Book displayDetailBook(String bookid){
        if(bookid.trim().isEmpty()||bookid==null){
            throw new IllegalArgumentException("The BookId is required");              
        }
        int id;
        try{
             id= Integer.parseInt(bookid);
            if(id<=0){
                 throw new IllegalArgumentException("Invaild bookid");              
            }
        }catch(NumberFormatException e){
            throw new IllegalArgumentException("The bookid format is not correct");
        }
        try{
            Book book=null;
            book=bookDAO.readById(id);
            if(book!=null){
                List<BookVariants> list=variantDAO.searchByBookId(id);
                book.setVariants(list);
            }
            return book;
        }
        catch(Exception e){
            System.err.println("Error display book");
            e.printStackTrace();
            return new Book();
        }
    }
    public List<Rating> getRatingOfBook(int id){
        List<Rating> list=new ArrayList<>();
        try{
            List<BookVariants> variants=variantDAO.searchByBookId(id);
            for(BookVariants variant:variants){
                
                int varid=variant.getBookVarId();
                 List<Rating> variantRating=ratingDao.ratingByBooks(varid);
                 
                 if(variantRating!=null){
                     list.addAll(variantRating);
                 }
            }
            return list;
        }catch(Exception e){
            System.err.println("Có lỗi trong quá trình tải rating");
            return new ArrayList<>();
        }
    }
    
    public List<Book> displayAllBook(){
        List<Book> list;
        try{
            list=bookDAO.readAll();
            return list;
            
        }catch(Exception e){
            System.err.println("Có lỗi trong quá trình lấy giữ liệu");
            return new ArrayList<>();
        }
    }
    
    public int countBook(int bookInPage){
        int count=bookDAO.getTotalBook();
        int endPage=count/bookInPage;
        if(count%bookInPage!=0){
            endPage++;
        }
        return endPage;  
    }
    
    public List<Book> getBookByIndex(int index){
        return bookDAO.pagingBook(index);
    }
    
    public List<BookVariants> getVariantByBook(int bookId){
        return variantDAO.readById(bookId);
    }
    
    
    public static void main(String[] args) {
        BookService bookService=new BookService();
        Book book=bookService.displayDetailBook("2");
        List<Rating> listRate=bookService.getRatingOfBook(book.getBookId());
        System.out.println(book);
        for(Rating r:listRate){
            System.out.println(r);
        }
    }
}
