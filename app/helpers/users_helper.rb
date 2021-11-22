module UsersHelper

    # returns the Gravatar for the given user
    def gravatar_for(user)
        gravatar_url = "https://secure.gravatar.come/avatar/"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
