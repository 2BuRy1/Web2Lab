import com.google.gson.Gson;
import data.Dot;
import managers.FunctionCalc;
import managers.RequestReader;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AreaCheckServlet extends HttpServlet {
RequestReader requestReader = new RequestReader();
Gson gson = new Gson();

FunctionCalc functionCalc = new FunctionCalc();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Dot dot = requestReader.readRequest(request);

        try {
            dot.status(functionCalc.isInTheSpot(dot));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        List<Dot> dots =(List<Dot>) request.getSession().getAttribute("result");
        if(dots == null){

            dots = new ArrayList<>();

        }
        dots.add(0, dot);
        request.getSession().setAttribute("result", dots);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String answer = String.format(gson.toJson(dot));
        response.getWriter().write(answer);
    }



}
