import {CartItem, Item, OrderItem} from './ItemModel'
import {ItemData} from './ItemData'

export class LocalDataManager{
  private static localDataManager: LocalDataManager
  private cartList: CartItem[] = []
  private orderData: OrderItem[] = []

  private constructor() {

  }

  static instance(){
    if(!LocalDataManager.localDataManager){
      LocalDataManager.localDataManager = new LocalDataManager()
    }
    return LocalDataManager.localDataManager
  }

  queryItemList() {
    return ItemData
  }

  // 通过ID搜索物品
  queryItemListById(id: string){
    const result = ItemData.filter(item => item.id == id)[0];
    return result
  }

  queryItemListByTitle(title: string){
    const results = ItemData.filter(item => item.title.toLowerCase().includes(title.toLowerCase()))
    return results
  }

  queryCartList(){
    return this.cartList
  }

  insertCart(id: string, quantity: number, styles?: number[]){
    const item = this.queryItemListById(id)
    const cartItem: CartItem = new CartItem(item, quantity, styles)
    this.cartList.splice(0, 0, cartItem)
  }

  deleteCart(ids: string[]){
    ids.forEach(id => {
      const result = this.cartList.filter((cartItem: CartItem) => cartItem.item.id == id)
      if(result.length > 0){
        this.cartList.splice(this.cartList.indexOf(result[0]), 1)
      }
    });
  }

  queryOrderList(){
    return this.orderData
  }

  insertOrder(id: string, quantity: number, styles?: number[]){
    const item = this.queryItemListById(id)
    const time = new Date().toString()
    const orderItem: OrderItem = new OrderItem(item, quantity, time, styles)
    this.orderData.splice(0, 0, orderItem)
  }

  insertOrderFromCart(cartItem: CartItem){
    this.insertOrder(
      cartItem.item.id,
      cartItem.quantity,
      cartItem.styles
    )
  }
}