#SCSlidingCell

SCSlidingCell реализует функционал ячеек со слайдами, как в приложении FB.

В этом репозитории находится тестовое приложение, которое демонстрирует возможности SCSlidingCell.

Как начать работу
------------
1. [Установите](http://docs.cocoapods.org/guides/installing_cocoapods.html) CocoaPods, если вы еще не сделали этого.
2. Перейдите в папку проекта.
3. Добавьте зависимость 
	```
    pod 'SCSlidingCell'
    ```
4. Установите зависимости:
    ```
    pod install
    ```
5. В заголовочный файл проекта с TableView добавьте:
	```
    <SCSlidingCell/SlidingCell.h>
    ```

Как использовать SCSlidingCell?!
---------------------------

**SCSliginCell** состоит из класса ячейки _SCSliginCell_, протокола данных _SCSliginCellDataSource_ и делегата _SCSlidingCellDelegate_.

Для работы программы View Controller обязан наследовать <SCSlidingCellDataSource>
```
...ViewController : <SCSlidingCellDataSource>
```
и реализовать обязательные методы

```
- (NSUInteger) numberOfSlides
{
	retrun <количество слайдов>;
}
- (UIView *) slideViewForCell:(SCSlidingCell *)cell withIndex:(NSUInteger) index andFrame:(CGRect) frame;
{
	return <представление слайда под номером index для ячейки cell>;
}
```
Дополнительно можно реализовать методы <SCSlidingCellDelegate>:
```
-(void) slidingCell:(SCSlidingCell *)slidingCell didSelectedView:(UIView *)view
{
	NSLog(@"скроллинг закончился на такой то ячейке");
}
```
Свойства
----

`alignment` - выравнивание при прокрутке (`SCSlidingCellViewAligmentLeft`, `SCSlidingCellViewAligmentCenter`, `SCSlidingCellViewAligmentRight`)

Пример: в случае динамического создания ячеек
------
```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    SCSlidingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[SCSlidingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.dataSource = self;
    cell.delegate = self;
    
    return cell;
}
```
##License
Использование разрешается в соответствии с [MIT License](http://http//opensource.org/licenses/mit-license.php). Смотри подробнее в LICENSE.
