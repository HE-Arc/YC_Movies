require 'test_helper'

class PrestationOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestation_order = prestation_orders(:one)
  end

  test "should get index" do
    get prestation_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_prestation_order_url
    assert_response :success
  end

  test "should create prestation_order" do
    assert_difference('PrestationOrder.count') do
      post prestation_orders_url, params: { prestation_order: { availabilities: @prestation_order.availabilities, day: @prestation_order.day, email: @prestation_order.email, entreprise: @prestation_order.entreprise, firstname: @prestation_order.firstname, interview: @prestation_order.interview, length: @prestation_order.length, month: @prestation_order.month, name: @prestation_order.name, other: @prestation_order.other, place: @prestation_order.place, product: @prestation_order.product, tel: @prestation_order.tel, typeofproduct: @prestation_order.typeofproduct } }
    end

    assert_redirected_to prestation_order_url(PrestationOrder.last)
  end

  test "should show prestation_order" do
    get prestation_order_url(@prestation_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_prestation_order_url(@prestation_order)
    assert_response :success
  end

  test "should update prestation_order" do
    patch prestation_order_url(@prestation_order), params: { prestation_order: { availabilities: @prestation_order.availabilities, day: @prestation_order.day, email: @prestation_order.email, entreprise: @prestation_order.entreprise, firstname: @prestation_order.firstname, interview: @prestation_order.interview, length: @prestation_order.length, month: @prestation_order.month, name: @prestation_order.name, other: @prestation_order.other, place: @prestation_order.place, product: @prestation_order.product, tel: @prestation_order.tel, typeofproduct: @prestation_order.typeofproduct } }
    assert_redirected_to prestation_order_url(@prestation_order)
  end

  test "should destroy prestation_order" do
    assert_difference('PrestationOrder.count', -1) do
      delete prestation_order_url(@prestation_order)
    end

    assert_redirected_to prestation_orders_url
  end
end
