require_dependency "no_cms/admin/news/application_controller"

module NoCms::Admin::News
  class ItemsController < ApplicationController

    before_filter :load_menu_section
    before_filter :load_item, only: [:edit, :update, :destroy]
    before_filter :load_sidebar, only: [:index, :new, :edit]


    def new
      @item = NoCms::News::Item.new
    end

    def create
      @item = NoCms::News::Item.new item_params
      if @item.save
        @nocms_logger.info(I18n.t('.no_cms.admin.news.items.create.success', title: @item.title), true)
        redirect_to edit_item_path(@item)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.news.items.create.error', title: @item.title))
        load_sidebar
        render :new
      end
    end

    def edit
      @nocms_logger.add_message :news, I18n.t('.no_cms.admin.news.items.edit.log_messages', title: @item.title)
    end

    def update
      if @item.update_attributes item_params
        @nocms_logger.info(I18n.t('.no_cms.admin.news.items.update.success', title: @item.title), true)
        redirect_to edit_item_path(@item)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.news.items.update.error', title: @item.title))
        load_sidebar
        render :edit
      end
    end

    def destroy
      if @item.destroy
        @nocms_logger.info(I18n.t('.no_cms.admin.news.items.destroy.success', title: @item.title), true)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.news.items.destroy.error', title: @item.title), true)
      end
      redirect_to items_path
    end

    private

    def load_menu_section
      @current_section = 'items'
    end

    def load_item
      @item = NoCms::News::Item.friendly.find(params[:id])
    end

    def load_sidebar
      @items = NoCms::News::Item.all
    end

    def item_params
      item_params = params.require(:item).permit(:title, :body, :slug, :published_at, :draft, category_ids: [])
      item_params.delete :slug unless item_params[:slug].blank?
      item_params
    end

  end
end
