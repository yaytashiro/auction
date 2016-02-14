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

	def destroy
		@items = Item.find(params[:id])
		#.destroyで一発で破壊することができる
		@item.destroy
		#削除したら飛ばすページがないのでセオリー的には
		#一覧ページに飛ばされるよね
		redirect_to items_url
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
