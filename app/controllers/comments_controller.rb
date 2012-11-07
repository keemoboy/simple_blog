class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(params[:comment])
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.article, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render 'articles/show'}
        format.json { render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.article }
      format.json { head :no_content }
    end
  end
end
