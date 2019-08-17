<?php

namespace src;

class AbTest
{
    private $strategy;
    private $cases;
    private $cookie;

    public function __construct(string $strategy, array $abTests, Cookie $cookie)
    {
        $this->strategy = $strategy;
        $this->cases = self::getCases($strategy, $abTests);
        $this->cookie = $cookie;
    }

    public function getCase(): string
    {
        if ($case = $this->cookie->get()) {
            return "get existing case $case";
        } else {
            $case = $this->generateCase();
            $this->cookie->set($case);
            return "set case $case";
        }
    }

    private function generateCase(): string
    {
        $randNum = rand(1, 100);
        $intervals = array_map('intval', explode('/', $this->strategy));
        $sum = 0;
        $caseIndex = 0;

        foreach ($intervals as $interval) {
            $sum += $interval;
            if ($randNum <= $sum) {
                break;
            }
            $caseIndex++;
        }
        return $this->cases[$caseIndex];
    }

    private static function getCases(string $key, array $tests)
    {
        try {
            if (isset($tests[$key])) {
                return $tests[$key];
            } else {
                throw new \Exception("Strategy $key not found in available tests");
            }
        } catch (\Exception $e) {
            die($e->getMessage());
        }
    }
}