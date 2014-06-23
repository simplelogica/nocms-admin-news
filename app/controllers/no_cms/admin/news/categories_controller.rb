require_dependency "no_cms/admin/news/application_controller"

module NoCms::Admin::News
  class CategoriesController < ApplicationController

    before_filter :load_menu_section
    before_filter :load_category, only: [:edit, :update, :destroy]
    before_filter :load_sidebar, only: [:index, :new, :edit]


    def new
      @category = NoCms::News::Category.new
    end

    def create
      @category = NoCms::News::Category.new category_params
      if @category.save
        @nocms_logger.info(I18n.t('.no_cms.admin.news.categories.create.success', title: @category.title), true)
        redirect_to edit_category_path(@category)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.news.categories.create.error', title: @category.title))
        load_sidebar
        render :new
      end
    end

    def edit
      @nocms_logger.add_message :news, I18n.t('.no_cms.admin.news.categories.edit.log_messages', title: @category.title)
    end

    def update
      if @category.update_attributes category_params
        @nocms_logger.info(I18n.t('.no_cms.admin.news.categories.update.success', title: @category.title), true)
        redirect_to edit_category_path(@category)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.news.categories.update.error', title: @category.title))
        load_sidebar
        render :edit
      end
    end

    def destroy
      if @category.destroy
        @nocms_logger.info(I18n.t('.no_cms.admin.news.categories.destroy.success', title: @category.title), true)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.news.categories.destroy.error', title: @category.title), true)
      end
      redirect_to categories_path
    end

    private

    def load_menu_section
      @current_section = 'categories'
    end

    def load_category
      @category = NoCms::News::Category.find(params[:id])
    end

    def load_sidebar
      @categories = NoCms::News::Category.all
    end

    def category_params
      params.require(:category).permit(:title)
    end

  end
end
