module ApplicationHelper

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def format_date(obj)
        date = obj.created_at.to_date

        date.strftime("%B %d, %Y at %I:%M %P")
    end

    def admin?
        current_user.access == "admin"
    end

    def member?
        current_user.access == "member"
    end
end
