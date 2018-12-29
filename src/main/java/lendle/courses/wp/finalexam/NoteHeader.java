/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.wp.finalexam;

import javax.swing.text.html.HTML;

/**
 *
 * @author lendle
 */
public class NoteHeader {
    private String id=null;
    private String title=null;
    private String date=null;

    public NoteHeader() {
    }

    public NoteHeader(String id, String title, String date) {
        this.id=id;
        this.title=title;
        this.date=date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
