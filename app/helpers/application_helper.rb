module ApplicationHelper

    def current_researcher
        @researcher ||= Researcher.find_by_id(session[:researcher_id])
    end

    def logged_in?
        !!current_researcher
    end

    def format_date(obj)
        date = obj.created_at.to_date

        date.strftime("%B %d, %Y at %I:%M %P")
    end

    def admin?
        current_researcher.access == "admin"
    end

    def member?
        current_researcher.access == "member"
    end
end
