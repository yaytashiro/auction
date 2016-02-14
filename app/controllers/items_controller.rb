class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def index
		@items = Item.all
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		#この段階ではまだ更新前
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to @item
	end

	def show
		@item = Item.find(params[:id])
	end
	
	# このメソッドは動作用なので表示するviewがないので
	# リダイレクトしてくれるようにコードを記述する
	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to @item
	end

	private
	def item_params 
		params.require(:item).permit(
			:name, :description, :price,
			:seller_id, :email, :image_url
		)
	end

end
