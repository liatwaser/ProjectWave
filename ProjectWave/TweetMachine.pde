
class TweetMachine extends Thread 
{   
  boolean running;           // Is the thread running?  Yes or no?
  int wait;                  // How many milliseconds should we wait in between executions?

  ConfigurationBuilder cb = new ConfigurationBuilder();
  Twitter twitterInstance;
  Query queryForTwitter;


  boolean tweetsAvailable;

  ArrayList tweets;


  TweetMachine(String queryText) {
    wait = 30000;
    running = false;

    cb.setOAuthConsumerKey("**********");
    cb.setOAuthConsumerSecret("**********");
    cb.setOAuthAccessToken("**********");
    cb.setOAuthAccessTokenSecret("**********");

    twitterInstance = new TwitterFactory(cb.build()).getInstance();
    queryForTwitter = new Query(queryText);

    tweetsAvailable = false;
    
    FetchTweets();

    start();
  }

  void FetchTweets() {
    try {
      QueryResult result = twitterInstance.search(queryForTwitter);
      tweets = (ArrayList) result.getTweets();

      tweetsAvailable = true;
    } 
    catch(TwitterException te) {
      println("Couldn't connect:" + te);
    } // end of catch
  }// end of FetchTweets

  int getNumTweets()
  {
    return tweets.size();
  }


  // Overriding "start()"
  void start () {
    // Set running equal to true
    running = true;
    // Print messages
    println("Starting thread (will execute every " + wait + " milliseconds.)"); 
    // Do whatever start does in Thread, don't forget this!
    super.start();
  }


  // We must implement run, this gets triggered by start()
  void run () {
    while (running) {
      println("Fetching Tweets");
      FetchTweets();

      println("I have got " + getNumTweets() + " tweets");

      // Ok, let's wait for however long we should wait
      try {
        sleep((long)(wait)); // relax
      } 
      catch (Exception e) {
      }
    }
  }
};

