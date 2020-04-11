public class Post {
	protected int id;
	protected String comedian;
    protected String url;
    protected String title;
    protected String description;
    protected String tags;
    protected String score;
    protected String comment;
    
    public Post() {
    	
    }
    
    public Post(int id) {
        this.id = id;
    }
    
    public Post(int id, String comedian, String url, String title, String description, String tags, String score, String comment) {
        this(comedian, url, title, description, tags, score, comment);
        this.id = id;
    }
    
    public Post(String comedian, String url, String title, String description, String tags, String score, String comment) {
    	this.comedian = comedian;
    	this.url = url;
    	this.title = title;
        this.description = description;
        this.tags = tags;
        this.score = score;
        this.comment = comment;
    }
    
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
    public String getComedian() {
        return comedian;
    }
    
    public void setComedian(String comedian) {
        this.comedian = comedian;
    }
    
    public String getUrl() {
        return url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getTags() {
        return tags;
    }
    
    public void setTags(String tags) {
        this.tags = tags;
    }
    
    public String getScore() {
        return score;
    }
    
    public void setScore(String score) {
        this.score = score;
    }
    
    public String getComment() {
        return comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
}
