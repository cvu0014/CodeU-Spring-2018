package codeu.controller;

import codeu.model.data.User;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class SearchServletTest {

 private SearchServlet searchServlet;
 private HttpServletRequest mockRequest;
 private HttpServletResponse mockResponse;
 private RequestDispatcher mockRequestDispatcher;
 private UserStore mockUserStore;

 @Before
 public void setup() {
   searchServlet = new SearchServlet();
   mockRequest = Mockito.mock(HttpServletRequest.class);
   mockResponse = Mockito.mock(HttpServletResponse.class);
   mockRequestDispatcher = Mockito.mock(RequestDispatcher.class);

   mockUserStore = Mockito.mock(UserStore.class);
    searchServlet.setUserStore(mockUserStore);
   Mockito.when(mockRequest.getRequestDispatcher("/WEB-INF/view/search.jsp"))
       .thenReturn(mockRequestDispatcher);
 }

 @Test
 public void testDoGet() throws IOException, ServletException {
   searchServlet.doGet(mockRequest, mockResponse);

   Mockito.verify(mockRequestDispatcher).forward(mockRequest, mockResponse);
 }
}