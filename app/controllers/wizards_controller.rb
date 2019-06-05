class WizardsController < ApplicationController
  before_action :load_user_wizard, except: %i(validate_step)

  def validate_step
    current_step = params[:current_step]

    @user_wizard = wizard_user_for_step(current_step)
    @user_wizard.user.build_user_address
    @user_wizard.user.build_user_detail
    @user_wizard.user.attributes = user_wizard_params
    session[:user_attributes] = @user_wizard.user.attributes
    if @user_wizard.valid?
      next_step = wizard_user_next_step(current_step)
      create and return unless next_step

      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create
    binding.pry
    if @user_wizard.user.save!
      session[:user_id] = @user_wizard.user.id
      redirect_to user_path(session[:user_id]), notice: 'User succesfully created!'
    else
      redirect_to({ action: Wizard::User::STEPS.first }, alert: 'There were a problem when creating the user.')
    end
  end

  private

  def load_user_wizard
    @user_wizard = wizard_user_for_step(action_name)
    # @user_wizard_build_user_address
    # @user_wizard_build_user_detail
  end

  def wizard_user_next_step(step)
    Wizard::User::STEPS[Wizard::User::STEPS.index(step) + 1]
  end

  def wizard_user_for_step(step)
    raise InvalidStep unless step.in?(Wizard::User::STEPS)

    "Wizard::User::#{step.camelize}".constantize.new(session[:user_attributes])
  end

  def user_wizard_params
    params.require(:user_wizard).permit(
      :nickname,
      :email,
      :password,
      user_detail_attributes: [
      :id,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana
      ],
      user_address_attributes: [
      :id,
      :postal_code,
      :prefecture,
      :city,
      :address,
      :building_name
      ]
    )
  end

  class InvalidStep < StandardError; end
end
