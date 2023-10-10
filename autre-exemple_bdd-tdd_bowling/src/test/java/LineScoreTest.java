import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

class LineScoreTest {
    @Test
    void score_zero_when_all_gutters() {
        List<String> frames = List.of("- -");
        int score = LineScore.compute(frames);
        assertThat(score).isEqualTo(0);
    }

    @Test
    void score_number_of_fallen_pins() {
        List<String> frames = List.of("3 4", "5 3");
        int score = LineScore.compute(frames);
        assertThat(score).isEqualTo(15);
    }

    @Test
    void spare_scores_10_plus_next_shot() {
        List<String> frames = List.of("3 /", "5 -");
        int score = LineScore.compute(frames);
        assertThat(score).isEqualTo(20);
    }

    @Test
    void strike_scores_10_plus_next_two_shots() {
        List<String> frames = List.of("X", "5 4");
        int score = LineScore.compute(frames);
        assertThat(score).isEqualTo(28);
    }
}