import router from '@ohos.router'
import {MainHeader} from '../components/MainHeader/MainHeader'
import {Item} from '../viewmodel/ItemModel'
import {ItemData} from '../viewmodel/ItemData'

@Builder function ItemCard(item:Item){
  Row({space:10}){
    Image(item.image)
      .width(120)
    Column({space:4}){
      Text(''+item.title)
        .fontSize(20)
        // .fontWeight(FontWeight.Bold)
        // .padding(5)
        .maxLines(2)
        .width('50%')
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textAlign(TextAlign.Start)
        .copyOption(CopyOptions.InApp)
      Text('￥'+item.price)
        .fontColor('#F36')
        .fontSize(18)
    }
    .height('100%')
    .alignItems(HorizontalAlign.Start)
  }
  .width('100%')
  .backgroundColor('#FFF')
  .borderRadius(20)
  .height(150)
  .padding(10)
  .onClick(()=>{
    router.pushUrl({
      url: 'pages/ItemDetail',
      params:{
        id: item.id
      }
    },
      (err) => {
        if (err) {
          console.error(`路由失败, errcode: ${err.code}, errMsg: ${err.message}`);
        }
      })
  })
}

@Entry
@Component
struct ItemShowcase {
  // private items:Array<Item>=[
  //   new Item('xjp11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111','http://cpc.people.com.cn/NMediaFile/2022/1023/MAIN202210232301000042669064937.jpg',2952),
  //   new Item('lkq','https://www.gov.cn/guoqing/2018-03/18/W020230525012299397583.jpg',114),
  //   new Item('hjt','https://bkimg.cdn.bcebos.com/pic/bd315c6034a85edf8db16c1b941d1e23dd54564edffb',2951),
  //   new Item('jzm','https://bkimg.cdn.bcebos.com/pic/91529822720e0cf3d7ca42c4e413e51fbe096b637ccc',2950),
  //   new Item('mzd','https://bkimg.cdn.bcebos.com/pic/80cb39dbb6fd5266d0161eb90750802bd40735fa984c',114514),
  //   new Item('xjp','http://cpc.people.com.cn/NMediaFile/2022/1023/MAIN202210232301000042669064937.jpg',2952),
  //   new Item('xjp','http://cpc.people.com.cn/NMediaFile/2022/1023/MAIN202210232301000042669064937.jpg',2952),
  //   new Item('xjp','http://cpc.people.com.cn/NMediaFile/2022/1023/MAIN202210232301000042669064937.jpg',2952),
  // ]

  build(){
    Column({space:8}){

      // Header({title:'列表'})
      MainHeader()
      List({space:8}){
        ForEach(
          //1.要遍历的数组,2.页面组件生成函数
          ItemData,(item:Item) => {
            ListItem(){
              ItemCard(item)
            }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)
  }

}