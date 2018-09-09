package helper;

import com.lcj.manage.model.User;

import javax.servlet.http.HttpSession;

public class SessionHelper {
    public static User getUser(HttpSession session){
        return (User)session.getAttribute("user");
    }
}
