class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_product,only: [:buy]

  def show
    @product = Product.find(params[:id])
  end
  
 

  def buy
    if @card.blank?
      redirect_to  product_path
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
     @product = Product.find(params[:id])
     # 購入した際の情報を元に引っ張ってくる
     card = current_user.cards.first
     card = Card.find_by(user_id: current_user.id)
     Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
     Payjp::Charge.create(
     amount: @product.price, #支払金額を入力（itemテーブル等に紐づけても良い） @product.price
     customer: card.customer_id, #顧客ID
     currency: 'jpy', #日本円
     # amount: {13500} #支払金額を入力（itemテーブル等に紐づけても良い）
     # customer: {card.customer_id} #顧客ID
     # currency: {'jpy'}, #日本円
    )
    @product.update(buyer_id: current_user.id)
    redirect_to done_purchases_path #完了画面に移動
     # redirect_to done_product_purchase_index_path(product_id: @product.id) #完了画面に移動
    end 
  end
  # def pay
  #   if @card.blank?
  #     redirect_to  product_path
  #     flash[:alert] = '購入にはクレジットカード登録が必要です'
  #   else
  #     @product = Product.find(params[:id])
  #    # 購入した際の情報を元に引っ張ってくる
  #    card = current_user.cards.first
  #    card = Card.find_by(user_id: current_user.id)
  #    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  #    Payjp::Charge.create(
  #    amount: @product.price, #支払金額を入力（itemテーブル等に紐づけても良い） @product.price
  #    customer: card.customer_id, #顧客ID
  #    currency: 'jpy', #日本円
  #    # amount: {13500} #支払金額を入力（itemテーブル等に紐づけても良い）
  #    # customer: {card.customer_id} #顧客ID
  #    # currency: {'jpy'}, #日本円
  #   )
  #   @product.update(buyer_id: current_user.id)
  #   redirect_to done_purchase_path #完了画面に移動
  #    # redirect_to done_product_purchase_index_path(product_id: @product.id) #完了画面に移動
  #   end 
 
  # end

  def done
    @parent = Category.where(ancestry: nil)
  end


  private
  def set_product
    @product = Product.find(params[:id])
  end
  
end
