class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :basic_auth, if: :production?
  before_action :current_user
  before_action :search_header_category, if: :use_search_header_category?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

    # メインヘッダーが使用されているビューにのみ, 行うbeforeアクション
    # 行わないビューのコントローラーでは use_search_header_category?メソッドの戻り値をfalseにオーバーライドすることで処理を飛ばす
    def search_header_category
      @header_category_parents = Category.roots
    end
  
    # 条件チェック用のアクション
    def use_search_header_category?
      true
    end
end
