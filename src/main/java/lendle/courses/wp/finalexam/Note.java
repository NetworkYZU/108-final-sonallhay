/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.wp.finalexam;

/**
 *
 * @author lendle
 */
public class Note {
    private NoteHeader header=null;
    private String content=null;

    public Note() {
    }

    public Note(NoteHeader header, String content) {
        this.header=header;
        this.content=content;
    }
    
    public NoteHeader getHeader() {
        return header;
    }

    public void setHeader(NoteHeader header) {
        this.header = header;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
