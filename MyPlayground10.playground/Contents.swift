import UIKit

var greeting = "Hello, playground"


class ThirdViewController: UIViewController {
    
    struct Post {
        var author: String //никнейм автора публикации
        var description: String //текст публикации
        var image: String //имя картинки из каталога
        var likes: Int //количество лайков
        var views: Int //количество просмотров
    }
    
    var post1 = Post(author: "никнейм автора публикации", description: "текст публикации", image: "1", likes: 123, views: 23)
    var post2 = Post(author: "никнейм автора публикации", description: "текст публикации", image: "1", likes: 123, views: 23)
    var post3 = Post(author: "никнейм автора публикации", description: "текст публикации", image: "1", likes: 123, views: 23)
    var post4 = Post(author: "никнейм автора публикации", description: "текст публикации", image: "1", likes: 123, views: 23)
    
    var posts: [Post] = []
    posts.append(post1)
    
}


