package dev.razigli.Server;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import tools.jackson.databind.ObjectMapper;

public class NoteRepository {
    private final Path notesDirectory;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public NoteRepository(String dirPath) throws IOException {
        notesDirectory = validateDirectory(dirPath);
    }

    public NoteRepository() throws IOException {
        String homeDir = System.getProperty("user.home");
        String defDir = "/.notes/";
        notesDirectory = validateDirectory(homeDir + defDir);
    }

    private Path validateDirectory(String dirPath) throws IOException {
        Path path = Paths.get(dirPath).toAbsolutePath().normalize();
        if (Files.exists(path)) {
            if (!Files.isDirectory(path)) {
                throw new IOException("Ошибка при создании: " + dirPath);
            }
            // каталог уже существует
        } else {
            Files.createDirectories(path);
            // создаем каталог
        }

        return path;
    }

    public List<Map<String, String>> getDirFiles() throws IOException {
        try (Stream<Path> paths = Files.list(notesDirectory)) {
            return paths
                    .parallel()
                    .map(file -> objectMapper.readValue(file, Note.class))
                    .map(note -> Map.of(
                            "date", note.getDate(),
                            "time", note.getTime(),
                            "name", note.getName()))
                    .collect(Collectors.toList());
        }
    }

    public String[] getDirList() {
        String[] files = notesDirectory.toFile().list();
        return files != null ? files : new String[0];
    }

    public void createNote(Note note) {
        if (note.getName() == null) {
            note.setName(note.getDate() + " " + note.getTime() + ".json");
        }
        String filePath = notesDirectory.toString() + "/" + note.getName();
        Path path = Paths.get(filePath).toAbsolutePath().normalize();
        if (!checkFile(note.getName())) {
            try {
                Files.createFile(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            throw new NoteAlreadyExistsException("Файл уже существует");
        }
        writeNote(note);
    }

    public void writeNote(Note note) {
        String filePath = notesDirectory.toString() + "/" + note.getName();
        Path path = Paths.get(filePath).toAbsolutePath().normalize();
        if (!checkFile(note.getName())) {
            throw new NoteNotFoundException("Файл не существует");
        }
        try (FileWriter fileWriter = new FileWriter(path.toFile())) {
            String text = objectMapper.writeValueAsString(note);
            fileWriter.write(text);
        } catch (Exception e) {
            System.out.println(e.toString() + " line 69");
        }
    }

    public void deleteNote(String fileName) {
        if (checkFile(fileName)) {
            try {
                String filePath = notesDirectory.toString() + "/" + fileName;
                Path path = Paths.get(filePath).toAbsolutePath().normalize();
                Files.delete(path);
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        } else {
            throw new NoteNotFoundException("Файл не найдён");
        }
    }

    public Note readNote(String fileName) {
        // читаем файл.
        if (checkFile(fileName)) {
            String filePath = notesDirectory.toString() + "/" + fileName;
            Path path = Paths.get(filePath).toAbsolutePath().normalize();
            try {
                String text = Files.readString(path);
                return objectMapper.readValue(new File(filePath), Note.class);
            } catch (Exception e) {
                System.out.println(e.toString());
                return new Note();
            }
        }
        return new Note();
    }

    public boolean checkFile(String fileName) {
        String filePath = notesDirectory.toString() + "/" + fileName;
        Path path = Paths.get(filePath).toAbsolutePath().normalize();

        // проверяем файл на существование.
        if (!Files.exists(path)) {
            return false;
        } else {
            return true;
        }
    }
}
