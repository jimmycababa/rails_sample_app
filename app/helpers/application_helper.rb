module ApplicationHelper
<<<<<<< HEAD
    # Returns the full title on a per-page basis
=======
    # returns the full title on a per-page basis
>>>>>>> rails-flavored-ruby
    def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        if page_title.empty?
            base_title
        else
<<<<<<< HEAD
            page_title + ' | ' + base_title
=======
            "#{page_title} | #{base_title}"
>>>>>>> rails-flavored-ruby
        end
    end
end
