class CommentsController < ApplicationController
  def create
    @page = Page.find(params[:page_id])
    @comment = @page.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user
    @comment.save

    if @comment.save
      redirect_to page_path(@page)
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:page_id])
    @comment = @page.comments.find(params[:id])
  end

  def update
    @page = Page.find(params[:page_id])
    @comment = @page.comments.find(params[:id])

    if @comment.update(params[:comment].permit(:comment))
      redirect_to page_path(@page)
    else
      render 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:page_id])
    @comment = @page.comments.find(params[:id])
    @comment.destroy
    redirect_to page_path(@page)
  end
end
