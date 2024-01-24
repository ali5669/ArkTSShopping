import {CartItem, Item, OrderItem} from '../viewmodel/ItemModel'
import {ItemData} from '../viewmodel/ItemData'

export class LocalDataManager{
  private static localDataManager: LocalDataManager
  private shopCartData: CartItem[] = []
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

  queryShopCart(){
    return this.shopCartData
  }

  insertShopCart(id: string, styles: number[], quantity: number){
    const item = this.queryItemListById(id)
    const cartItem: CartItem = new CartItem(item, quantity, styles)
    this.shopCartData.splice(0, 0, cartItem)
  }

  queryOrderList(){
    return this.orderData
  }

  insertOrderList(id: string, styles: number[], quantity: number){
    const item = this.queryItemListById(id)
    const orderItem: OrderItem = new OrderItem(item, quantity, styles)
    this.orderData.splice(0, 0, orderItem)
  }
}