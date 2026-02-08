package dev.razigli.Server;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
    private NoteRepository noteRepository;

    @GetMapping("/read")
    public Note read(@RequestParam(name = "filename") String fileName) {
        try {
            if (noteRepository == null) {
                noteRepository = new NoteRepository();
            }
            Note note = noteRepository.readNote(fileName);
            return note;
        } catch (Exception e) {
            return new Note("Error");
        }
    }

    @GetMapping("/list")
    public List<Map<String, String>> notesList() {
        System.out.println("START");
        try {
            if (noteRepository == null) {
                noteRepository = new NoteRepository();
            }
            List<Map<String, String>> list = noteRepository.getDirFiles();
            System.out.println(list.isEmpty());
            return list;
        } catch (Exception e) {
            System.out.println(e.toString());
            return null;
        }
    }

    @DeleteMapping("/delete")
    public ResponseEntity<?> delete(@RequestParam(name = "filename") String fileName) {
        try {
            if (noteRepository == null) {
                noteRepository = new NoteRepository();
            }
            noteRepository.deleteNote(fileName);
            return ResponseEntity.ok("Заметка удалена!!!");
        } catch (Exception e) {
            Map<String, String> errorResponse = Map.of("error", "файл не найден", "status", "404");
            return ResponseEntity.status(404).body(errorResponse);
        }
    }


    @PostMapping("/write")
    public ResponseEntity<?> write(@RequestBody Note note) {
        try {
            if (noteRepository == null) {
                noteRepository = new NoteRepository();
            }
            noteRepository.createNote(note);
            return ResponseEntity.ok("Заметка создана");
        } catch (Exception e) {
            Map<String, String> errorResponse = Map.of("error", "файл уже существует", "status", "409");
            return ResponseEntity.status(409).body(errorResponse);
        }
    }
    
    @PutMapping("/edit")
    public ResponseEntity<?> edit(@RequestBody Note note) {
        try {
            if (noteRepository == null) {
                noteRepository = new NoteRepository();
            }
            noteRepository.writeNote(note);
            return ResponseEntity.ok("Заметка отредактирована!");
        } catch (Exception e) {
            Map<String, String> errorResponse = Map.of("error", "файл не найден", "status", "404");
            return ResponseEntity.status(404).body(errorResponse);
        }
    }
}
