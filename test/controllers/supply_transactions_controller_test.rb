require 'test_helper'

class SupplyTransactionsControllerTest < ActionController::TestCase
  setup do
    @supply_transaction = supply_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supply_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supply_transaction" do
    assert_difference('SupplyTransaction.count') do
      post :create, supply_transaction: { user_id: @supply_transaction.user_id }
    end

    assert_redirected_to supply_transaction_path(assigns(:supply_transaction))
  end

  test "should show supply_transaction" do
    get :show, id: @supply_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supply_transaction
    assert_response :success
  end

  test "should update supply_transaction" do
    patch :update, id: @supply_transaction, supply_transaction: { user_id: @supply_transaction.user_id }
    assert_redirected_to supply_transaction_path(assigns(:supply_transaction))
  end

  test "should destroy supply_transaction" do
    assert_difference('SupplyTransaction.count', -1) do
      delete :destroy, id: @supply_transaction
    end

    assert_redirected_to supply_transactions_path
  end
end
