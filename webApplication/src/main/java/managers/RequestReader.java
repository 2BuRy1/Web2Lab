package managers;

import com.google.gson.Gson;
import data.Dot;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;

public class RequestReader {


    public Dot readRequest(HttpServletRequest request) {
        Gson gson = new Gson();
        StringBuilder jsonStringBuilder = new StringBuilder();
        String line;

        try (BufferedReader reader = request.getReader()) {
            // Чтение тела запроса построчно
            while ((line = reader.readLine()) != null) {
                jsonStringBuilder.append(line);
            }

            // Преобразуем строку JSON в объект User
            return gson.fromJson(jsonStringBuilder.toString(), Dot.class);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }


}




