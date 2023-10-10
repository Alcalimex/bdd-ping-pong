import java.util.Arrays;
import java.util.List;

public class LineScore {
    public static final int MAX_PINS_ON_SLOPE = 10;
    public static final String SPARE = "/";
    private static final String STRIKE = "X";
    private static final String GUTTER_SYMBOL = "-";

    public static int compute(List<String> frames) {
        List<String> shots = frames.stream()
                .map(frame -> frame.split(" "))
                .flatMap(Arrays::stream)
                .toList();

        int result = 0;
        int currentShotIndex = 0;
        while (currentShotIndex < shots.size()) {
            String[] shotsInCurrentFrame = {shots.get(currentShotIndex), shots.get(currentShotIndex + 1)};

            if (isStrike(shotsInCurrentFrame[0])) {
                String[] shotsInNextFrame = {shots.get(currentShotIndex + 1), shots.get(currentShotIndex + 2)};
                result += applyStrikeBonus(shotsInNextFrame);
                currentShotIndex += 1;
            } else if (isSpare(shotsInCurrentFrame[1])) {
                result += applySpareBonus(shots.get(currentShotIndex + 2));
                currentShotIndex += 2;
            } else {
                result += parseShots(shotsInCurrentFrame);
                currentShotIndex += 2;
            }
        }

        return result;
    }

    private static int applyStrikeBonus(String[] shotsInNextFrame) {
        return MAX_PINS_ON_SLOPE + parseShots(shotsInNextFrame);
    }

    private static boolean isStrike(String shot) {
        return STRIKE.equals(shot);
    }

    private static int applySpareBonus(String bonusShot) {
        return MAX_PINS_ON_SLOPE + parseShot(bonusShot);
    }

    private static int parseShots(String[] shots) {
        return parseShot(shots[0]) + parseShot(shots[1]);
    }

    private static boolean isSpare(String shot) {
        return SPARE.equals(shot);
    }

    private static int parseShot(String shot) {
        if (isGutter(shot)) {
            return 0;
        }
        return Integer.parseInt(shot);
    }

    private static boolean isGutter(String shot) {
        return GUTTER_SYMBOL.equals(shot);
    }
}
