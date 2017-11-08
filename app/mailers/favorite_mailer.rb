class FavoriteMailer < ApplicationMailer
    default from: "jacob.yun429@gmail.com"

    def new_comment(user, post, comment)

        headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
        headers["References"] = "<post/#{post.id}@bloccit.example>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "New comment on #{post.title}")
    end

    def new_post(post)
    
        headers["Message-ID"] = "<posts/#{post.id}@bloccit.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
        headers["References"] = "<post/#{post.id}@bloccit.example>"

        @post = post
        mail(to: post.user.email, subject: "You're following #{post.title}" )
    end
end
