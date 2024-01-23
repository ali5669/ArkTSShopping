import router from '@ohos.router'
// import {Item} from '../datatype/Item'
import {Item} from '../viewmodel/ItemModel'
import {ItemData} from '../viewmodel/ItemData'

@Component
export struct Index {
  private username:string
  @Styles fillScreen(){
    .width('100%')
    .backgroundColor('#EFEFEF')
    .padding(30)
  }

  build() {
    Column(){
      Row(){
        Column(){
          Text('用户名: '+this.username)
            .fontSize(15)
        }
      }
      .height(25)
      Row(){
        Column(){
          Text('商品热卖中！')
            .fontWeight(FontWeight.Bold)
            .fontSize(30)
            .fontColor('#E92F4F')
        }
      }
      Row(){
        Swiper(){
          ForEach(ItemData,(item:Item)=>{
            Image(item.image)
          })
        }
        .index(0)
        .indicator(true)
        .autoPlay(true)
        .height(100)

      }
      List(){
        ForEach(ItemData,(item:Item)=>{
          this.Items(item)
        })
      }
      .lanes(2)
      .width('95%')
      .height('100%')
    }
  }
  @Builder Items(item:Item){
    Column(){
      Image(item.image)
        .width(100)
        .height(100)
        .objectFit(ImageFit.Contain)
      Column(){
        Text(item.title)
          .maxLines(2)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Text('￥'+item.price)
          .fontColor('#E92F4F')
          .fontSize(16)
      }
    }
    .height(200)
    .padding(30)
    .backgroundColor('#EFEFEF')
    .borderRadius(25)
    .margin(8)
    .onClick(()=>{
      router.pushUrl(
        {
          url: 'pages/ItemDetail',
          params:{
            id: item.id
          }
        },
        router.RouterMode.Single,
        (err) => {
          if (err) {
            console.error(`路由失败, errcode: ${err.code}, errMsg: ${err.message}`);
          }
        }
      )
    })
  }
}