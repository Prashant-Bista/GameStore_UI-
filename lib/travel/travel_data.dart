class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;
  final double rating;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author, this.rating);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://media.cntraveler.com/photos/66da1701ca987cae3ccf032b/16:9/w_960,c_limit/GettyImages-962650558.jpg',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa',4),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://imagedelivery.net/Ahwf2rDz3ZiXm1qkpDKg1w/live/-/media/C777B7F12837486C84667423FC6486C1.jpg/w=750?d=20231227T054325&w=750',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore',5),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://youinjapan.net/tokyo/thumbs/tokyo-cover-l.jpg',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya',4.5),
];
