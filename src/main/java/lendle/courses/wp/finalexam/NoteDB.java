/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.wp.finalexam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author lendle
 */
public class NoteDB {
    private static Map<String, Note> db=new HashMap<>();
    static{
        db.put("note1", new Note(new NoteHeader("note1", "note1", "2018-12-28"), "content1"));
        db.put("note2", new Note(new NoteHeader("note2", "note2", "2018-12-25"), "content2"));
        db.put("note3", new Note(new NoteHeader("note3", "note3", "2018-12-20"), "content3"));
    }
    
    public static List<Note> getNotes(){
        return new ArrayList(db.values());
    }
    
    public static Note getNote(String id){
        return db.get(id);
    }
    
    public static void addNote(Note note){
        db.put(note.getHeader().getId(), note);
    }
    
    public static void editNote(Note note){
        db.put(note.getHeader().getId(), note);
    }
    
    public static void deleteNote(String id){
        db.remove(id);
    }
    
    public static List<NoteHeader> getNoteHeaders(){
        List<NoteHeader> list=new ArrayList<>();
        for(Note note : getNotes()){
            list.add(note.getHeader());
        }
        return list;
    }
}
