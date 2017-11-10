module UsersHelper
    def users_posts(posts)
        if posts.any?
            render @user.posts
        else
            "#{@user.name} has not submitted any posts yet."
        end
    end

    def users_comments(comments)
        if comments.any?
            render @user.comments
        else
            "#{@user.name} has not submitted any comments yet."
        end
    end

    def users_favorites(favorites)
        if favorites.any?
            render @user.faves
        else
            "#{@user.name} has not favorited any posts yet."
        end
    end


end
