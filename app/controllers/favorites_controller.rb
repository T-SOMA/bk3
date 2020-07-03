class FavoritesController < ApplicationController
	def create
		user = current_user
		book = Book.find(params[:book_id])
		favorite = Favorite.create(user_id: user.id, book_id: book.id)
		redirect_to books_path(book)
	end

	def destroy
		user = current_user
		book = Book.find(params[:book_id])
		favorite = Favorite.find_by(user_id: user.id, book_id: book.id)
		favorite.delete
		redirect_to books_path(book)
	end
end
