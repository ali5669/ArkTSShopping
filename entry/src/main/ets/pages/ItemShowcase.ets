import router from '@ohos.router'
import {MainHeader} from '../components/MainHeader/MainHeader'
import {Item} from '../viewmodel/ItemModel'
import {ItemData} from '../viewmodel/ItemData'
import {LocalDataManager} from '../viewmodel/LocalDataManager'

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

@Entry
@Component
struct ItemShowcase {
  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @State params: any = router.getParams()
  @State searchText:string = this.params.text
  @State searchItemData: Item[] = this.localDataManager.queryItemListByTitle(this.searchText)

  build(){
    Column({space:8}){
      MainHeader()
      Row() {
        Image($r('app.media.search1')).width(30)
        TextInput({placeholder:'输入搜索内容',text:this.searchText})
          .width(200)
          .backgroundColor('#FFFFFF')
          .onChange(value=>{
            this.searchText=value
          })

        Button('搜索')
          .backgroundColor('#F8332D')
          .onClick(()=>{
            this.searchItemData = this.localDataManager.queryItemListByTitle(this.searchText)
          })

      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('90%')

      List({space:8}){
        ForEach(
          //1.要遍历的数组,2.页面组件生成函数
          this.searchItemData,(item:Item) => {
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