module ApplicationHelper

    def current_researcher
        @current_researcher ||= Researcher.find_by_id(session[:researcher_id])
    end

    def logged_in?
        !!current_researcher
    end

    def admin?
        current_researcher.access == "admin"
    end

    def member?
        current_researcher.access == "member"
    end
end
